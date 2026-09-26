# 90 Days of AI Engineering

A structured 90-day learning roadmap to go deeper into **AI engineering** through concepts, implementation, evaluation, and production-oriented projects.

This repository is where I’ll document what I learn, build, and practice throughout the challenge.

The goal is not to collect frameworks or rush through tutorials.

The goal is to understand the underlying ideas well enough to:

- explain them clearly
- implement them
- test them
- evaluate whether they work
- understand where they fail
- connect them to real AI systems

---

## The Approach

The learning loop for this roadmap is:

```text
Learn
  ↓
Understand
  ↓
Implement
  ↓
Verify
  ↓
Share
```

Some days will be mostly conceptual.

Other days will involve notebooks, APIs, model training, retrieval systems, agents, evaluation, infrastructure, or system-design work.

---

## 90-Day Tracker

I created an Excel tracker for the full roadmap.

It includes:

- Day
- Phase
- Main topic
- Concepts to explore
- End-of-day deliverable
- Status
- Notes

You can use the same tracker to follow along:

[**Download the 90-Day AI Engineer Tracker**](./AI_Engineer_90_Day_Tracker.xlsx)

---

## Repository Structure

```text
90-days-AI-Engineer/
│
├── README.md
├── AI_Engineer_90_Day_Tracker.xlsx
│
└── python/
    ├── Day 1 notes
    ├── Day 2 NumPy notebook
    ├── Day 3 pandas notebook
    └── ...
```

The `python/` folder contains the early learning notes and hands-on notebooks.

As the roadmap progresses, the repository can expand into folders for areas such as:

```text
python/
machine-learning/
deep-learning/
llms/
rag/
agents/
multimodal/
evaluation/
serving/
mlops/
system-design/
capstone/
```

The exact structure may evolve as the project grows.

---

# Roadmap

## Days 1–12 — Python, Data, SQL, APIs, Math, and ML Foundations

This phase builds the foundations needed before moving into neural networks and LLMs.

Topics include:

- Python revision and project setup
- NumPy
- pandas
- SQL
- HTTP and APIs
- linear algebra
- calculus and gradients
- probability and statistics
- Bayes theorem and sampling
- ML problem framing
- train/validation/test splits
- evaluation metrics
- classical ML models
- recommendation-system foundations
- PCA / SVD intuition
- dimensionality reduction

By the end of this phase, the goal is to be comfortable working with data, querying databases, using APIs, framing ML problems, training baselines, and evaluating results.

---

## Days 13–25 — Deep Learning and PyTorch

This phase moves into neural networks and model training.

Topics include:

- PyTorch tensors
- Dataset and DataLoader
- neural-network basics
- activation functions
- losses
- entropy and cross-entropy
- KL-divergence intuition
- backpropagation
- autograd
- optimizers
- training loops
- checkpointing
- regularization
- normalization
- residual connections
- numerical stability
- embeddings
- CNNs
- RNNs / LSTMs
- GPU training
- mixed precision

The emphasis is not just learning PyTorch syntax, but understanding how models are trained, debugged, and evaluated.

---

## Days 26–40 — Transformers, LLMs, and AI APIs

This phase focuses on the modern language-model stack.

Topics include:

- tokenization
- vocabularies and token IDs
- autoregressive language modeling
- token embeddings
- positional information
- self-attention
- Query / Key / Value
- multi-head attention
- causal masking
- Transformer blocks
- GPT-style architecture
- Hugging Face
- AI provider APIs
- structured outputs
- prompting
- decoding
- temperature
- top-k / top-p
- LLM inference
- KV cache
- context engineering
- fine-tuning
- LoRA / QLoRA
- SFT
- RLHF / DPO intuition

One goal is to build a small GPT-style model so the path from tokenization to generation makes sense end to end.

---

## Days 41–51 — Embeddings, Search, and RAG

This phase focuses on retrieval and external knowledge.

Topics include:

- dense embeddings
- cosine similarity
- dot-product similarity
- vector normalization
- vector databases
- pgvector / Qdrant
- approximate nearest-neighbor search
- HNSW
- keyword search
- TF-IDF / BM25
- hybrid search
- metadata filters
- document parsing
- chunking
- query rewriting
- reranking
- RAG pipelines
- citations
- retrieval evaluation
- Precision@K
- Recall@K
- MRR
- NDCG
- groundedness and answer quality

The aim is to move beyond “embed and retrieve” into a RAG system that can actually be measured and improved.

---

## Days 52–61 — Agents and MCP

Once LLMs and retrieval make sense, this phase moves into tool-using systems.

Topics include:

- tool and function calling
- tool schemas
- workflow vs agent
- agent loops
- state
- persistence
- checkpoints
- memory
- context management
- Model Context Protocol (MCP)
- hosts, clients, servers
- tools, resources, prompts
- capability discovery
- authentication / authorization
- human approval
- least privilege
- agent evaluation
- tool-selection accuracy
- trajectory evaluation
- latency and cost

The goal is to understand the actual components behind agent systems rather than only learning an agent framework.

---

## Days 62–66 — Computer Vision and Multimodal AI

This is a shorter section focused on working with non-text inputs.

Topics include:

- image pixels and channels
- preprocessing
- resizing / cropping
- CNNs
- ResNet / EfficientNet
- Vision Transformers
- transfer learning
- object detection
- segmentation
- CLIP
- vision-language models
- video
- audio
- OCR
- speech-to-text
- multimodal embeddings

---

## Days 67–72 — Evaluation, Safety, Metrics, and Governance

This phase is about testing AI systems properly.

Topics include:

- evaluation design
- golden datasets
- regression tests
- LLM evaluation
- human evaluation
- LLM-as-a-judge
- retrieval evaluation
- agent evaluation
- system-level evaluation
- prompt injection
- indirect prompt injection
- PII and secrets
- unsafe tool execution
- output validation
- sandboxing
- audit logs
- provenance
- human oversight
- A/B testing
- reliability scorecards

The goal is to understand not only whether a system works, but **how you know it works**.

---

## Days 73–79 — APIs, Docker, Model Serving, and Inference

This phase moves from using AI models to building services around them.

Topics include:

- FastAPI
- REST endpoints
- request / response schemas
- Pydantic
- authentication
- authorization
- rate limiting
- API versioning
- retries
- timeouts
- idempotency
- streaming
- SSE
- WebSockets
- background jobs
- queues
- Docker
- Docker Compose
- model serving
- batching
- quantization
- KV cache
- latency
- throughput
- load testing
- p50 / p95 / p99
- CI/CD
- deployment
- rollback
- cloud infrastructure basics
- IAM
- secrets
- object storage
- managed databases

---

## Days 80–87 — MLOps, Databases, Observability, and System Design

This phase brings the system together at production scale.

Topics include:

- experiment tracking
- MLflow
- dataset and model versioning
- reproducibility
- feature stores
- training-serving skew
- logs
- metrics
- traces
- OpenTelemetry
- drift monitoring
- SLI / SLO
- consistency and availability
- replication
- partitioning
- sharding
- queues
- caches
- load balancers
- SQL vs NoSQL
- AI system design
- QPS
- latency
- freshness
- reliability
- GPU vs CPU
- cost
- batch vs real-time systems
- failure handling

This phase ends with a timed AI system-design exercise.

---

## Days 88–90 — Production-Grade Final Project

The final three days are for integrating and hardening a project that has been evolving throughout the roadmap.

The project should start from a real problem and use only the concepts that make sense for that problem.

A possible end-to-end flow might look like:

```text
problem definition
        ↓
data
        ↓
database / storage
        ↓
APIs
        ↓
AI / ML components
        ↓
retrieval / tools where useful
        ↓
evaluation
        ↓
safety checks
        ↓
metrics
        ↓
governance / auditability
        ↓
observability
        ↓
deployment
```

The goal is **not** to force every topic from the 90 days into one project.

The goal is to build something that feels like a real engineering system rather than a disconnected notebook or demo.

By the end, I want to be able to:

- show it
- explain the architecture
- explain the tradeoffs
- describe the evaluation
- discuss failure modes
- defend the technical decisions

---

# How to Use This Repository

You can follow the roadmap in a few different ways.

### 1. Follow day by day

Start with Day 1 and move through the tracker in order.

The sequence is intentional because later topics build on earlier ones.

### 2. Use the tracker

Update:

- status
- notes
- deliverables

as you complete each day.

[**Open the tracker**](./AI_Engineer_90_Day_Tracker.xlsx)

### 3. Run the notebooks

For practical topics such as NumPy and pandas, open the notebook and execute the cells one at a time.

The notebooks are designed to explain:

```text
what the concept means
        ↓
what the code is doing
        ↓
what the output means
        ↓
a small exercise
```

### 4. Build instead of only reading

The roadmap includes end-of-day deliverables because finishing a tutorial is not the same thing as being able to use the idea.

Try to leave each day with something concrete:

- a notebook
- a script
- a model
- an API
- an evaluation
- a diagram
- a benchmark
- a small implementation

### 5. Adjust the pace

The roadmap is organized into 90 days, but there is no requirement to finish it in exactly 90 calendar days.

Some topics will take longer than others.

If a concept is still unclear, spend more time on it.

---

# What This Roadmap Is Not

This is **not**:

- a promise that 90 days will make someone an expert
- a complete computer-science curriculum
- a replacement for real engineering experience
- a list of every AI library or framework
- the only valid path into AI engineering

The point is to create a structured path through the concepts that matter most for the type of AI engineering I want to understand.

---

# Disclaimer

I’m not an expert, and this repository is **not intended to be a definitive AI Engineer curriculum for everyone**.

This roadmap was created for my own learning based on:

- the AI Engineer roadmap I’m following
- official documentation and learning resources
- additional research
- topics I personally want to understand better
- gaps I discover while implementing things

The roadmap may change as I progress.

Some topics may take longer than expected. Some may be shortened. New topics may be added if implementation reveals an important gap.

Different AI roles also require different depth.

For example:

- an ML researcher may need much deeper mathematics
- an inference engineer may need more CUDA and systems knowledge
- a computer-vision engineer may need more image-processing depth
- an agent engineer may spend more time on tools, state, evaluation, and reliability

So treat this repository as a **learning path and reference**, not a universal prescription.

If you use it, adapt it to your own background, goals, and pace.

---

# Follow Along

I’ll continue adding notes, notebooks, implementations, and projects as I work through the roadmap.

If you’re following along too:

1. Download the tracker
2. Start with Day 1
3. Run the exercises
4. Build the deliverables
5. Keep notes on what worked and what didn’t

[**Download the 90-Day AI Engineer Tracker**](./AI_Engineer_90_Day_Tracker.xlsx)

Happy learning :)
